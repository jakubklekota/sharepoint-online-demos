export interface IUserDetailsList {
  key: string;
  firstname: string;
  lastname: string;
  phone: string;
  location: string;
}

export interface IUseCreateModel {
  key: string;
  firstname: string;
  lastname: string;
  phone: string;
  idlocation: number;
  locationName: string;
}

export interface IUseDeleteModel {
  id: number;
}
