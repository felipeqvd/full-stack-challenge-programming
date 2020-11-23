import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

const baseURL = 'http://localhost:3000';

@Injectable({
  providedIn: 'root'
})
export class PersonsService {

  constructor(private httpClient: HttpClient) { }

  readAll(): Observable<any> {
    return this.httpClient.get(baseURL+'/persons');
  }

  create(data): Observable<any> {
    return this.httpClient.post(baseURL+'/persons', data);
  }  
}