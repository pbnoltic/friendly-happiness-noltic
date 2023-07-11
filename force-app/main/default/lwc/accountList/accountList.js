import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/BaseController.getAccounts';

export default class AccountList extends LightningElement {

  @wire(getAccounts) accounts;
  selectedAccountId;
  handleClick(event){
    this.selectedAccountId = event.target.dataset.accountid;
  }

}