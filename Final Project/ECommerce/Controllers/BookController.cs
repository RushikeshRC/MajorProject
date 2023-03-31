using ECommerce.Interfaces;
using ECommerce.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace ECommerce.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    public class BookController : Controller
    {
        readonly IWebHostEnvironment _hostingEnvironment;
        readonly IBookService _bookService;
        readonly IConfiguration _config;
        readonly string coverImageFolderPath = string.Empty;

        public BookController(IConfiguration config, IWebHostEnvironment hostingEnvironment, IBookService bookService)
        {
            _config = config;
            _bookService = bookService;
            _hostingEnvironment = hostingEnvironment;
            coverImageFolderPath = Path.Combine(_hostingEnvironment.WebRootPath, "Upload");
            if (!Directory.Exists(coverImageFolderPath))
            {
                Directory.CreateDirectory(coverImageFolderPath);
            }
        }

       
        /// Get the list of available books
       
        /// returns List of Book
        [HttpGet]
        public async Task<List<Book>> Get()
        {
            return await Task.FromResult(_bookService.GetAllBooks()).ConfigureAwait(true);
        }

    
        /// Get the specific book data corresponding to the BookId
   
        /// param name="id"
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Book book = _bookService.GetBookData(id);
            if (book != null)
            {
                return Ok(book);
            }
            return NotFound();
        }

        
        /// Get the list of available categories
        
        
        [HttpGet]
        [Route("GetCategoriesList")]
        public async Task<IEnumerable<Categories>> CategoryDetails()
        {
            return await Task.FromResult(_bookService.GetCategories()).ConfigureAwait(true);
        }

      
        /// Get the random five books from the category of book whose BookId is supplied

        /// param name="bookId"
     
        [HttpGet]
        [Route("GetSimilarBooks/{bookId}")]
        public async Task<List<Book>> SimilarBooks(int bookId)
        {
            return await Task.FromResult(_bookService.GetSimilarBooks(bookId)).ConfigureAwait(true);
        }

       
        /// Add a new book record
       
      
        [HttpPost, DisableRequestSizeLimit]
        [Authorize(Policy = UserRoles.Admin)]
        public int Post()
        {
            Book book = JsonConvert.DeserializeObject<Book>(Request.Form["bookFormData"].ToString());

            //Book book = new Book();
            

            if (Request.Form.Files.Count > 0)
            {
                var file = Request.Form.Files[0];

                if (file.Length > 0)
                {
                    string fileName = Guid.NewGuid() + ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    string fullPath = Path.Combine(coverImageFolderPath, fileName);
                    using (var stream = new FileStream(fullPath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                    book.CoverFileName = fileName;
                }
            }
            else
            {
                book.CoverFileName = _config["DefaultCoverImageFile"];
            }
            return _bookService.AddBook(book);
        }

     
        /// Update a particular book record
    
      
        [HttpPut]
        [Authorize(Policy = UserRoles.Admin)]
        public int Put()
        {
            Book book = JsonConvert.DeserializeObject<Book>(Request.Form["bookFormData"].ToString());
            if (Request.Form.Files.Count > 0)
            {
                var file = Request.Form.Files[0];

                if (file.Length > 0)
                {
                    string fileName = Guid.NewGuid() + ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    string fullPath = Path.Combine(coverImageFolderPath, fileName);
                    bool isFileExists = Directory.Exists(fullPath);

                    if (!isFileExists)
                    {
                        using (var stream = new FileStream(fullPath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }
                        book.CoverFileName = fileName;
                    }
                }
            }
            return _bookService.UpdateBook(book);
        }

        /// Delete a particular book record
      
        /// param name="id"
      
        [HttpDelete("{id}")]
        [Authorize(Policy = UserRoles.Admin)]
        public int Delete(int id)
        {
            string coverFileName = _bookService.DeleteBook(id);
            if (coverFileName != _config["DefaultCoverImageFile"])
            {
                string fullPath = Path.Combine(coverImageFolderPath, coverFileName);
                if (System.IO.File.Exists(fullPath))
                {
                    System.IO.File.Delete(fullPath);
                }
            }
            return 1;
        }
    }
}
