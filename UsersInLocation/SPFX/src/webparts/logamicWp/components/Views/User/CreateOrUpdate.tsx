import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { LocationService } from '../../../services/LocationService';
import { UserService } from '../../../services/UserService';

import { TextField } from 'office-ui-fabric-react/lib/TextField';
import { Dropdown, DropdownMenuItemType, IDropdownStyles, IDropdownOption } from 'office-ui-fabric-react/lib/Dropdown';

import {
  autobind,
  DialogContent,
  DialogFooter,
  DialogType
} from 'office-ui-fabric-react';

import { PrimaryButton, DefaultButton } from 'office-ui-fabric-react/lib/Button';
import { BaseDialog } from '@microsoft/sp-dialog';
import { BorderLeftColorProperty } from 'csstype';
import { WebPartContext } from '@microsoft/sp-webpart-base';
import { ILocationItemModel } from '../../../models/LocationItemModel';

interface ICreateOrUpdateContentProps {
  title: string;
  subText: string;
  hideDialog: boolean;
  close: () => void;
  submit: (items: object) => void;
  ctx: WebPartContext;
}

class CreateUpdateContent extends React.Component<ICreateOrUpdateContentProps, {}> {

  private _locations: IDropdownOption[] = [];

  constructor(props) {
    super(props);
    
    this.state = {
      firstname: '',
      lastname: '',
      phone: '',
      idLocation: 0,
      locationName : ''
    }
  }

  public componentWillMount(): void {
    let _locationService = this.props.ctx.serviceScope.consume(LocationService.serviceKey);
    
    _locationService.search().then((locs: ILocationItemModel[]) => {
      for (let i = 0; i < locs.length; i++) {
        this._locations.push({
          key: locs[i].key,
          text: locs[i].name
        })
      }
    });
  }

  public render(): JSX.Element {
    return <DialogContent title={this.props.title} subText={this.props.subText} onDismiss={this.props.close}
      showCloseButton={true}>

      <TextField id='user-first-name' label='First name' required={true} onChange={this._handleFirstNameChange}/>
      <TextField id='user-last-name' label='Last name' required={true} onChange={this._handleLastNameChange}/>
      <TextField id='user-phone' label='Phone #' required={true} onChange={this._handlePhoneChange}/>

      <Dropdown placeholder="Select localization" label="Select localization" required={true} options={this._locations} onChange={this._handleLocalizationChange}/>

      <DialogFooter>
        <DefaultButton text='Cancel' title='Cancel' onClick={this.props.close} />
        <PrimaryButton text='OK' title='OK' onClick={() => { this.props.submit(this.state); }} />
      </DialogFooter>
    </DialogContent>
  }

  private _handleFirstNameChange = (event) => {
    this.setState({ firstname: event.target.value });
  };

  private _handleLastNameChange = (event) => {
    this.setState({ lastname: event.target.value });
  };

  private _handlePhoneChange = (event) => {
    this.setState({ phone: event.target.value });
  };

  private _handleLocalizationChange = (event: React.FormEvent<HTMLDivElement>, item: IDropdownOption): void => {
    this.setState({ idLocation: item.key });
  };

}
  
export default class CreateOrUpdate extends BaseDialog {
  public title: string;
  public subText: string;
  public hideDialog: boolean;
  public ctx: WebPartContext;

  public render(): void {
    ReactDOM.render(<CreateUpdateContent
      title={this.title}
      subText={this.subText}
      close={this.close}
      hideDialog={this.hideDialog}
      submit={this._submit} ctx={this.ctx}/>, this.domElement);
  }

  @autobind
  private _submit(item: any): void {

    let _userService = this.ctx.serviceScope.consume(UserService.serviceKey);

    _userService.create(JSON.stringify(item)).then((done: any) => {

    });

    this.close();
  }

  protected onAfterClose(): void {
    super.onAfterClose();

    window.location.reload(false);

    ReactDOM.unmountComponentAtNode(this.domElement);
  }
  
}
