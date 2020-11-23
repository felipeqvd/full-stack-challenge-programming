import { Component, OnInit } from '@angular/core';
import { PersonsService } from 'src/app/services/persons.service';

@Component({
  selector: 'app-persons-list',
  templateUrl: './persons-list.component.html',
  styleUrls: ['./persons-list.component.css']
})
export class PersonsListComponent implements OnInit {

  persons: any;
  currentPerson = null;
  currentIndex = -1;
  name = '';

  constructor(private personsService: PersonsService) { }

  ngOnInit(): void {
    this.readPersons();
  }

  readPersons(): void {
    this.personsService.readAll()
      .subscribe(
        persons => {
          this.persons = persons;
          console.log(persons);
        },
        error => {
          console.log(error);
        });
  }

  refresh(): void {
    this.readPersons();
    this.currentPerson = null;
    this.currentIndex = -1;
  }

  setCurrentPerson(person, index): void {
    this.currentPerson = person;
    this.currentIndex = index;
  }

}
