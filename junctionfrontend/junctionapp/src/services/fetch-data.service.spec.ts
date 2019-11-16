import { TestBed } from '@angular/core/testing';

import { FetchDataService } from './fetch-data.service';

describe('FetchDataService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: FetchDataService = TestBed.get(FetchDataService);
    expect(service).toBeTruthy();
  });
});
