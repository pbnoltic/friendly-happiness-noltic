import { LightningElement,api,wire } from 'lwc';
import getContactsByAccountId from '@salesforce/apex/BaseController.getContactsByAccountId';

export default class ContactList extends LightningElement {

  columns =  [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName'},
    { label: 'Email', fieldName: 'Email', type: 'email' },
  ];

  @api accountId;
  @wire(getContactsByAccountId,{accountId:'$accountId'}) contacts;
}