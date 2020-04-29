import * as React from 'react';
import { ILogamicWpProps } from '../../ILogamicWpProps';
import { IColumn, DetailsList, Spinner, Stack } from 'office-ui-fabric-react';
import { HomeService } from '../../../services/HomeService';

export interface IUsersInLocationList {
  key: string;
  location: string;
  userCount: string;
}

export interface IUsersInLocationState {
  loading: boolean;
  items: IUsersInLocationList[];
}


export class HomeView extends React.Component<ILogamicWpProps, IUsersInLocationState> {
  private _allItems: IUsersInLocationList[];

  private _columns: IColumn[];

  constructor(props: ILogamicWpProps) {
    super(props);

    this._allItems = [];

    this._columns = [
      { key: 'key', name: 'Location', fieldName: 'location', minWidth: 100, maxWidth: 200, isResizable: true },
      { key: 'key', name: 'Users', fieldName: 'userCount', minWidth: 100, maxWidth: 200, isResizable: true }
    ];

    this.state = {
      loading: true,
      items: this._allItems
    };
  }

  public componentDidMount(): void {

    let _homeService = this.props.ctx.serviceScope.consume(HomeService.serviceKey);

    _homeService.search().then((uil: IUsersInLocationList[]) => {
      this.setState({ items: uil, loading: false  });
    });
  }

  public render(): React.ReactElement<ILogamicWpProps> {
    const {items,loading} = this.state;

    return (
      <Stack>
      <div>
        <h2>Users in location</h2>
        <div>
        <DetailsList items={items}
          columns={this._columns}
          />
          {
            loading ? <Spinner label="Loading, be patient..." ariaLive="assertive" labelPosition="top" /> : null
          }
        </div>
        </div>
      </Stack>
    );
  }
}
