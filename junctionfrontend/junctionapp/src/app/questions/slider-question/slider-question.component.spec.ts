import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SliderQuestionComponent } from './slider-question.component';

describe('SliderQuestionComponent', () => {
  let component: SliderQuestionComponent;
  let fixture: ComponentFixture<SliderQuestionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SliderQuestionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SliderQuestionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
