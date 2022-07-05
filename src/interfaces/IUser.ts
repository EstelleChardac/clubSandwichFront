export default interface IUser {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  userName: string;
  userPassword: string;
  canCreateModify: number;
  canAlsoDelete: number;
  createdDate: Date;
}

// J'AI IMPORT l'interface IUser que l'on utilise dans le back a titre d'exemple
// En typeScript il faudra faire ces interfaces pour tous :)
