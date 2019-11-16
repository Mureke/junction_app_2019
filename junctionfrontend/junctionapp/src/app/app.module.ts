import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { IntoductionComponent } from './intoduction/intoduction.component';
import { InfoComponent } from './info/info.component';
import { TimeAndPlaceComponent } from './time-and-place/time-and-place.component';
import { QuestionsComponent } from './questions/questions.component';
import { PostcardsComponent } from './postcards/postcards.component';
import { SliderQuestionComponent } from './questions/slider-question/slider-question.component';
import { TagQuestionComponent } from './questions/tag-question/tag-question.component';

@NgModule({
  declarations: [
    AppComponent,
    IntoductionComponent,
    InfoComponent,
    TimeAndPlaceComponent,
    QuestionsComponent,
    PostcardsComponent,
    SliderQuestionComponent,
    TagQuestionComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
