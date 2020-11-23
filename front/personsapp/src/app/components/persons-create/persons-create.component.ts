import { Component, OnInit } from '@angular/core';
import { PersonsService } from 'src/app/services/persons.service';

@Component({
  selector: 'app-persons-create',
  templateUrl: './persons-create.component.html',
  styleUrls: ['./persons-create.component.css']
})
export class PersonsCreateComponent implements OnInit {

  person = {
    fullname: '',
    birth: '',
    identification_number: ''    
  };
  submitted = false;

  constructor(private personsService: PersonsService) { }

  ngOnInit(): void {
  }

  createPerson(): void {
    const data = {
      fullname: this.person.fullname,
      birth: this.person.birth,
      identification_number: this.person.identification_number
    };

    this.personsService.create(data)
      .subscribe(
        response => {
          if (response.success){
            this.submitted = true;
          }else{
            alert(response.message);
          }
          
        },
        error => {
          console.log(error);
        });
  }

  newPerson(): void {
    this.submitted = false;
    this.person = {
      fullname: '',
      birth: '',
      identification_number: ''
    };
  }

}
