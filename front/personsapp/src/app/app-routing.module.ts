import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PersonsListComponent } from './components/persons-list/persons-list.component';
import { PersonsCreateComponent } from './components/persons-create/persons-create.component';

const routes: Routes = [
  { path: '', redirectTo: 'persons', pathMatch: 'full' },
  { path: 'persons', component: PersonsListComponent },
  { path: 'create', component: PersonsCreateComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
