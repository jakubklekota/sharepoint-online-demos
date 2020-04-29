import { AadHttpClientFactory, AadHttpClient, HttpClientResponse } from "@microsoft/sp-http";
import { ServiceKey, ServiceScope } from '@microsoft/sp-core-library';

export interface IUsersInLocationList {
  key: string;
  location: string;
  userCount: string;
}

export interface IHomeService {
  search(): Promise<IUsersInLocationList[]>;
}

export class HomeService implements IHomeService {


  private _aadHttpClientFactory: AadHttpClientFactory

  public static readonly serviceKey: ServiceKey<IHomeService> =
    ServiceKey.create<IHomeService>('usersInLocations:IHomeService', HomeService);

  constructor(serviceScope: ServiceScope) {
    serviceScope.whenFinished(() => {
      this._aadHttpClientFactory = serviceScope.consume(AadHttpClientFactory.serviceKey);
    });
  }

  public search(): Promise<IUsersInLocationList[]> {

    let _searchResult: IUsersInLocationList[] = [];

    return new Promise((resolve, reject) => {
      this._aadHttpClientFactory.getClient('https://apispfxuil20200423084035.azurewebsites.net').then((client: AadHttpClient) => {
        client.post('https://apispfxuil20200423084035.azurewebsites.net/api/home/stat-user-location', AadHttpClient.configurations.v1, { method: 'POST' })
          .then((response: HttpClientResponse) => {
            return response.json();
          }).then((userinlocation: any) => {
            for (let i = 0; i < userinlocation.length; i++) {
              _searchResult.push({
                  key: i.toString(),
                  location: userinlocation[i].UserInLocation.LocationName,
                  userCount: userinlocation[i].UserInLocation.UserCount
                })
            }
            resolve(_searchResult);
          });
      });
    });
  }
}
