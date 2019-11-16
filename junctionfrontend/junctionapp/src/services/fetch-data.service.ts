import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class FetchDataService {
  constructor(private http: HttpClient) {
  }

  prepareHeaders(method: string = null) {
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json');
    headers = headers.set('Access-Control-Allow-Headers', '*');


    return headers;
  }

  async fetchDataGet(url: string) {
    try {
      return await this.http.get(url, {headers: this.prepareHeaders()}).toPromise().then(resp => {
        return resp;
      });
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

}

