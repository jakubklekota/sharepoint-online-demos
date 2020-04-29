import { ILocationItemModel } from '../models/LocationItemModel';
import { AadHttpClientFactory, HttpClientResponse, AadHttpClient } from '@microsoft/sp-http';
import { ServiceKey, ServiceScope } from '@microsoft/sp-core-library';

export interface ILocationService {
  search(model?: ILocationItemModel): Promise<ILocationItemModel[]>;
  //create(model: ILocationItemModel): Promise<ILocationItemModel>;
  //update(model: ILocationItemModel): Promise<ILocationItemModel>;
  //deleteIds(ids: number[]): Promise<boolean>
}

export class LocationService implements ILocationService {

  private _aadHttpClientFactory: AadHttpClientFactory

  public static readonly serviceKey: ServiceKey<ILocationService> =
    ServiceKey.create<ILocationService>('usersInLocations:ILocationService', LocationService);

  constructor(serviceScope: ServiceScope) {
    serviceScope.whenFinished(() => {
      this._aadHttpClientFactory = serviceScope.consume(AadHttpClientFactory.serviceKey);
    });
  }
  
  public search(model?: ILocationItemModel): Promise<ILocationItemModel[]> {

    let _searchResult: ILocationItemModel[] = [];

    return new Promise((resolve, reject) => {
      this._aadHttpClientFactory.getClient('https://apispfxuil20200423084035.azurewebsites.net').then((client: AadHttpClient) => {
        client.post('https://apispfxuil20200423084035.azurewebsites.net/api/location/search-location',
          AadHttpClient.configurations.v1,
          {
            method: 'POST',
            body: '{"LocationSearch":{}}'
          })
          .then((response: HttpClientResponse) => {
            return response.json();
          }).then((locations: any) => {
            for (let i = 0; i < locations.length; i++) {
              _searchResult.push({
                key: locations[i].LocationSearch.Id,
                name: locations[i].LocationSearch.Name
              })
            }
            resolve(_searchResult);
          });
      });
    });
  };

  //public create(model: ILocationItemModel): Promise<ILocationItemModel> {
  //  return new Promise((resolve, reject) => {
  //    resolve(true);
  //  });
  //};

  //public update(model: ILocationItemModel): Promise<ILocationItemModel> {
  //  return new Promise((resolve, reject) => {
  //    resolve(true);
  //  });
  //};
  
  //public delete(model: ILocationItemModel): Promise<ILocationItemModel> {
  //  return new Promise((resolve, reject) => {
  //    resolve(true);
  //  });
  //};

}
