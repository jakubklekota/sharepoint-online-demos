import * as React from 'react';

import { IUserDetailsList, IUseDeleteModel } from '../../../models/UserItemModel';

import {
  DetailsList,
  IColumn,
  Selection,
  SelectionMode,
  Stack,
  Spinner
} from 'office-ui-fabric-react';

import { CommandBar, ICommandBarItemProps } from 'office-ui-fabric-react/lib/CommandBar';
import CreateOrUpdate from './CreateOrUpdate';

import { UserService } from '../../../services/UserService';

import { ILogamicWpProps } from '../../ILogamicWpProps';

export interface IUserDetailsLitState {
  loading: boolean;
  items: IUserDetailsList[];
  selectionMode?: SelectionMode;
}

export class UserView extends React.Component<ILogamicWpProps, IUserDetailsLitState> {
  private _allItems: IUserDetailsList[];
  private _columns: IColumn[];
  private _selected: Selection;

  constructor(props: ILogamicWpProps) {
    super(props);

    this._allItems = [];

    this._columns = [
      { key: 'key', name: 'First name', fieldName: 'firstname', minWidth: 100, maxWidth: 200, isResizable: true },
      { key: 'key', name: 'Last name', fieldName: 'lastname', minWidth: 100, maxWidth: 200, isResizable: true },
      { key: 'key', name: 'Phone #', fieldName: 'phone', minWidth: 100, maxWidth: 200, isResizable: true },
      { key: 'key', name: 'Location', fieldName: 'location', minWidth: 100, maxWidth: 200, isResizable: true },
      { key: 'key', name: '', fieldName: 'edit', minWidth: 100, maxWidth: 200, isResizable: true }
    ];

    this.state = {
      loading: true,
      items: this._allItems,
      selectionMode: SelectionMode.multiple
    };
    
    this._selected = new Selection({
      onSelectionChanged: this._onItemsSelectionChanged,
    });
  }
  public componentDidMount(): void {
    let _userService = this.props.ctx.serviceScope.consume(UserService.serviceKey);

    _userService.search().then((users: IUserDetailsList[]) => {
      this.setState({ items: users, loading: false });
    });
  }

  public render(): JSX.Element {
    const {
      items,
      loading,
      selectionMode
    } = this.state;
    
    return (
      <Stack>
      <div>
        <h2>User List</h2>
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
              }, {
                key: 'delete-root',
                text: 'Delete',
                iconProps: { iconName: 'UserRemove' },
                split: true,
                subMenuProps: {
                  items: [
                    { key: 'delete-selected', text: 'Delete selected', onClick: this._onDeleteSelectedRow },
                    { key: 'delete-all', text: 'Delete all', onClick: this._onDeleteAllRow },
                  ],
                },
              }
            ]}
          />
        </div>
          <div>
          <DetailsList items={items}
            columns={this._columns}
            selection={this._selected}
            />
            {
              loading ? <Spinner label="Loading, be patient..." ariaLive="assertive" labelPosition="top" /> : null
            }
        </div>
      </div>
      </Stack>
    );
  }

  //selectionZoneProps = {{
  //selection: this._selected,
  //  disableAutoSelectOnInputElements: true,
  //    selectionMode: selectionMode,
  //          }}
  //            onRenderItemColumn={this._renderItemColumn}
  private _onItemsSelectionChanged = () => {
    //console.log('test', this._selected.getSelection());
    //console.log('this._selection.getSelectedCount()', this._selected.getSelectedCount());
    //this.setState({
    //  selectionCount: this._selection.getSelectedCount(),
    //});
  };

  private _onAddRow = (): void => {
    
    const dialog: CreateOrUpdate = new CreateOrUpdate();
    
    dialog.title = 'Create new user';
    dialog.subText = 'Use this form to create new user';

    dialog.ctx = this.props.ctx;

    dialog.show();
  };

  private _onEditRow = (): void => {

    const dialog: CreateOrUpdate = new CreateOrUpdate();

    dialog.title = 'Update user';
    dialog.subText = 'Use this form to update user';

    dialog.show();
  };

  private _onDeleteSelectedRow = (): void => {
    if (this._selected.getSelectedCount() > 0) {

      let _ids: IUseDeleteModel[] = [];
      for (let n = 0; n < this._selected.getSelection().length; n++) {
        _ids.push({
          id: parseInt(this._selected.getSelection()[n].key.toString())
        });
      }

      let _userService = this.props.ctx.serviceScope.consume(UserService.serviceKey);

      _userService.deleteIds(_ids).then((ids: IUseDeleteModel[]) => {
        this.setState((previousState: any) => {
          return {
            items: previousState.items.filter((item, index) => !this._selected.isIndexSelected(index)),
          };
        });
      });
    }
  };
  private _onDeleteAllRow = (): void => {
    console.log('_onDeleteAllRow');
    //if (this._selected.getSelectedCount() > 0) {

    //} else {
    //  this.setState({
    //    items: this.state.items.slice(1),
    //  });
    //}
  };

  private _renderItemColumn(item?: any, index?:number, column?:IColumn) {
    let fieldContent = item[column.fieldName];

    console.log('riC', fieldContent);

    //switch (column.key) {
    //  case 'file':
    //    return <Link onClick={this._onColumnClickView.bind(this)} id={item['id']}>{fieldContent}</Link>
    //  default:
        //return <span >{fieldContent}</span>;
   // }
  }
}
