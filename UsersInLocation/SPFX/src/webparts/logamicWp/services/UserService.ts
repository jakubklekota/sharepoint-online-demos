import { IUserDetailsList, IUseCreateModel, IUseDeleteModel } from '../models/UserItemModel';
import { AadHttpClientFactory, AadHttpClient, HttpClientResponse } from "@microsoft/sp-http";
import { ServiceKey, ServiceScope } from '@microsoft/sp-core-library';

export interface IUserService {
  search(): Promise<IUserDetailsList[]>;
  create(model: string): Promise<IUseCreateModel>;
  update(model: IUserDetailsList): Promise<IUserDetailsList>;
  deleteIds(ids: IUseDeleteModel[]): Promise<IUseDeleteModel[]>
}

export class UserService implements IUserService {

  private _aadHttpClientFactory: AadHttpClientFactory

  public static readonly serviceKey: ServiceKey<IUserService> =
    ServiceKey.create<IUserService>('usersInLocations:IUserService', UserService);

  constructor(serviceScope: ServiceScope) {
    serviceScope.whenFinished(() => {
      this._aadHttpClientFactory = serviceScope.consume(AadHttpClientFactory.serviceKey);
    });
  }

  public search(): Promise<IUserDetailsList[]> {

    let _searchResult: IUserDetailsList[] = [];

    return new Promise((resolve, reject) => {
      this._aadHttpClientFactory.getClient('https://apispfxuil20200423084035.azurewebsites.net').then((client: AadHttpClient) => {
        client.post('https://apispfxuil20200423084035.azurewebsites.net/api/user/search-user',
          AadHttpClient.configurations.v1,
          {
            method: 'POST',
            body: '{"UserSearch":{}}'
          })
          .then((response: HttpClientResponse) => {
            return response.json();
          }).then((users: any) => {
            for (let i = 0; i < users.length; i++) {
              _searchResult.push({
                key: users[i].UserSearch.Id,
                firstname: users[i].UserSearch.FirstName,
                lastname: users[i].UserSearch.LastName,
                phone: users[i].UserSearch.Phone,
                location: users[i].UserSearch.LocationName
              })
            }
            resolve(_searchResult);
          });
      });
    });
  };

  public create(model: string): Promise<IUseCreateModel> {
    return new Promise((resolve, reject) => {
      this._aadHttpClientFactory.getClient('https://apispfxuil20200423084035.azurewebsites.net').then((client: AadHttpClient) => {
        client.post('https://apispfxuil20200423084035.azurewebsites.net/api/user/create-user',
          AadHttpClient.configurations.v1,
          {
            method: 'POST',
            body: '{"UserCreate":'+model+'}'
          })
          .then((response: HttpClientResponse) => {
            return response.json();
          }).then((user: any) => {

            console.log('user', user);

            resolve();
          });
        });
    });
};

  public update(model: IUserDetailsList): Promise<IUserDetailsList> {
    return new Promise((resolve, reject) => {
      resolve();
    });
  };
  
  public deleteIds(ids: IUseDeleteModel[]): Promise<IUseDeleteModel[]> {

    let _json = JSON.stringify(ids);

    return new Promise((resolve, reject) => {
      this._aadHttpClientFactory.getClient('https://apispfxuil20200423084035.azurewebsites.net').then((client: AadHttpClient) => {
        client.post('https://apispfxuil20200423084035.azurewebsites.net/api/user/delete-user',
          AadHttpClient.configurations.v1,
          {
            method: 'POST',
            body: '{"UserDelete":' + _json + '}'
          })
          .then((response: HttpClientResponse) => {
            return response.json();
          }).then((ids: any) => {
            resolve(ids);
          });
      });
    });
  };
}
