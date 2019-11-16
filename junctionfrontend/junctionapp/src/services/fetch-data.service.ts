import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class FetchDataService {
  constructor(private http: HttpClient) {
  }

  async fetchData(url: string, params: object): Promise<object> {
    try {
      const response = await this.http.post(url, params).toPromise();
      return response;
    } catch (error) {
      throw error;
    }
  }
}
