
import { LightningElement, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import USER_OBJECT from '@salesforce/schema/User';
import FIRST_NAME_FIELD from '@salesforce/schema/Account.Name';
export default class ChatGpt extends LightningElement {
    showModal = false;

    openModal() {
       this.showModal = true;
    }


    @track firstName;
    @track lastName;
    @track email;
  
    handleChange(event) {
      this[event.target.name] = event.target.value;
    }
  
    handleSave() {
      const fields = {};
      fields[FIRST_NAME_FIELD.fieldApiName] = this.firstName;
      const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };
  
      // Create account record
      createRecord(recordInput)
        .then(account => {
          // Create contact record
          const contactFields = {
            AccountId: account.id,
            FirstName: this.firstName,
            LastName: this.lastName,
            Email: this.email
          };
          const contactRecordInput = {
            apiName: CONTACT_OBJECT.objectApiName,
            fields: contactFields
          };
          return createRecord(contactRecordInput);
        })
        .then(contact => {
          // Create user record
          const userFields = {
            ContactId: contact.id,
            Username: this.email,
            LastName: this.lastName,
            Email: this.email,
            CommunityNickname: this.firstName + this.lastName
          };
          const userRecordInput = {
            apiName: USER_OBJECT.objectApiName,
            fields: userFields
          };
          return createRecord(userRecordInput);
        })
        .then(user => {
          console.log(`User record created with id: ${user.id}`);
        })
        .catch(error => {
          console.error('error', error.body.message);
        });
    }
}