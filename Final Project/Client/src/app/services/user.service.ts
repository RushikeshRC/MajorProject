import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UserService {
//  baseURL= 'https://localhost:44392/api/user';
readonly baseURL="https://localhost:44392/api/user";

  constructor(private http: HttpClient) {

  }

  registerUser(userdetails) {
    return this.http.post(this.baseURL ,userdetails);
  }

  getCartItemCount(userId: number) {
    return this.http.get<number>(this.baseURL+ userId);
  }

  validateUserName(userName: string) {
    return this.http.get(this.baseURL+'/validateUserName/' + userName);
  }
}
