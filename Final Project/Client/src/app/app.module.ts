import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { ReactiveFormsModule, FormsModule } from '@angular/forms';
// import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import{HttpClientModule,HTTP_INTERCEPTORS} from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavBarComponent } from './components/nav-bar/nav-bar.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { HttpInterceptorService } from './interceptors/http-interceptor.service';
import { ErrorInterceptorService } from './interceptors/error-interceptor.service';

import { NgMaterialModule } from './ng-material/ng-material.module';
import { LoginComponent } from './components/login/login.component';
import { AddtocartComponent } from './components/addtocart/addtocart.component';
import { AddtowishlistComponent } from './components/addtowishlist/addtowishlist.component';
import { BookCardComponent } from './components/book-card/book-card.component';
import { BookDetailsComponent } from './components/book-details/book-details.component';
import { BookFilterComponent } from './components/book-filter/book-filter.component';
import { CheckoutComponent } from './components/checkout/checkout.component';
import { HomeComponent } from './components/home/home.component';
import { MyOrdersComponent } from './components/my-orders/my-orders.component';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { PriceFilterComponent } from './components/price-filter/price-filter.component';
import { SearchComponent } from './components/search/search.component';
import { ShoppingcartComponent } from './components/shoppingcart/shoppingcart.component';
import { SimilarbooksComponent } from './components/similarbooks/similarbooks.component';
import { ThemePickerComponent } from './components/theme-picker/theme-picker.component';
import { UserRegistrationComponent } from './components/user-registration/user-registration.component';
import { WishlistComponent } from './components/wishlist/wishlist.component';



@NgModule({
  declarations: [
    AppComponent,
    NavBarComponent,
    LoginComponent,
    AddtocartComponent,
    AddtowishlistComponent,
    BookCardComponent,
    BookDetailsComponent,
    BookFilterComponent,
    CheckoutComponent,
    HomeComponent,
    MyOrdersComponent,
    PageNotFoundComponent,
    PriceFilterComponent,
    SearchComponent,
    ShoppingcartComponent,
    SimilarbooksComponent,
    ThemePickerComponent,
    UserRegistrationComponent,
    WishlistComponent,
  ],
  imports: [
    NgMaterialModule,
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    FormsModule
  ],
  
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: HttpInterceptorService, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptorService, multi: true }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
