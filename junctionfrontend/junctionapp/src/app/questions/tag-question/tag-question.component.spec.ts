import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TagQuestionComponent } from './tag-question.component';

describe('TagQuestionComponent', () => {
  let component: TagQuestionComponent;
  let fixture: ComponentFixture<TagQuestionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TagQuestionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TagQuestionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
