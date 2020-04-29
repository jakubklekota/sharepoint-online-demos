import * as React from 'react';
import { DetailsList, IColumn, Spinner, Stack } from 'office-ui-fabric-react';
import { CommandBar } from 'office-ui-fabric-react/lib/CommandBar';

import { LocationService } from '../../../services/LocationService';
import { ILogamicWpProps } from '../../ILogamicWpProps';
import { ILocationItemModel } from '../../../models/LocationItemModel';

export interface ILocationDetailListState {
  loading: boolean;
  items: ILocationItemModel[];
}

export class LocalizationView extends React.Component<ILogamicWpProps, ILocationDetailListState> {
  private _allItems: ILocationItemModel[];
  private _columns: IColumn[];

  constructor(props: ILogamicWpProps) {
    super(props);

    this._allItems = [];

    this._columns = [
      { key: 'key', name: 'Location', fieldName: 'name', minWidth: 100, maxWidth: 200, isResizable: true }
    ];

    this.state = {
      loading: true,
      items: this._allItems
    };

  }

  public componentDidMount(): void {

    let _locationService = this.props.ctx.serviceScope.consume(LocationService.serviceKey);

    _locationService.search().then((locs: ILocationItemModel[]) => {
      this.setState({ items: locs, loading: false });
    });
  }

  public render(): React.ReactElement<{}> {

    const { items, loading } = this.state;

    return (
      <Stack>
      <div>
        <h2>Localization List</h2>
        <div>
          <CommandBar
            items={[
              {
                key: 'new-root',
                text: 'New',
                iconProps: { iconName: 'Add' },
                split: false,
                ariaLabel: 'New',
                onClick: this._onAddRow
              },
              {
                key: 'delete-root',
                text: 'Delete',
                iconProps: { iconName: 'UserRemove' },
                split: true,
                subMenuProps: {
                  items: [
                    { key: 'delete-selected', text: 'Delete selected' },
                    { key: 'delete-all', text: 'Delete all' },
                  ],
                },
              }
            ]}
          />
        </div>
        <div>
          <DetailsList items={items} columns={this._columns} />
          {
            loading ? <Spinner label="Loading, be patient..." ariaLive="assertive" labelPosition="top" /> : null
          }
        </div>
        </div>
      </Stack>
    );
  }

  private _onAddRow = (): void => {

    //const dialog: CreateOrUpdate = new CreateOrUpdate();

    //dialog.title = 'Create new user';
    //dialog.subText = 'Use this form to create new user';

    //dialog.show();
  };

  private _onEditRow = (): void => {

  };

  private _onDeleteRow = (): void => {
    //if (this._selection.getSelectedCount() > 0) {
    //  this.setState((previousState: IDetailsListAdvancedExampleState) => {
    //    return {
    //      items: previousState.items.filter((item, index) => !this._selection.isIndexSelected(index)),
    //    };
    //  });
    //} else {
    //  this.setState({
    //    items: this.state.items.slice(1),
    //  });
    //}
  };
}
