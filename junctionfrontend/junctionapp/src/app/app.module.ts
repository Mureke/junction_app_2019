import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { IntoductionComponent } from './intoduction/intoduction.component';
import { InfoComponent } from './info/info.component';
import { TimeAndPlaceComponent } from './time-and-place/time-and-place.component';
import { QuestionsComponent } from './questions/questions.component';
import { PostcardsComponent } from './postcards/postcards.component';

@NgModule({
  declarations: [
    AppComponent,
    IntoductionComponent,
    InfoComponent,
    TimeAndPlaceComponent,
    QuestionsComponent,
    PostcardsComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
