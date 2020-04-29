import * as React from 'react';
import * as ReactDom from 'react-dom';
import { Version } from '@microsoft/sp-core-library';
import {
  IPropertyPaneConfiguration,
  PropertyPaneTextField
} from '@microsoft/sp-property-pane';
import { BaseClientSideWebPart, WebPartContext, IWebPartContext } from '@microsoft/sp-webpart-base';

import * as strings from 'LogamicWpWebPartStrings';
import LogamicWp from './components/LogamicWp';
import { ILogamicWpProps } from './components/ILogamicWpProps';

export interface ILogamicWpWebPartProps {
  description: string;
}

export default class LogamicWpWebPart extends BaseClientSideWebPart<ILogamicWpWebPartProps> {

  public render(): void {

    const element: React.ReactElement<ILogamicWpProps> = React.createElement(
      LogamicWp,
      {
        description: this.properties.description,
        ctx: this.context
      }
    );

    ReactDom.render(element, this.domElement);
  }
  
  protected onDispose(): void {
    ReactDom.unmountComponentAtNode(this.domElement);
  }

  protected get dataVersion(): Version {
    return Version.parse('1.0');
  }

  protected getPropertyPaneConfiguration(): IPropertyPaneConfiguration {
    return {
      pages: [
        {
          header: {
            description: strings.PropertyPaneDescription
          },
          groups: [
            {
              groupName: strings.BasicGroupName,
              groupFields: [
                PropertyPaneTextField('description', {
                  label: strings.DescriptionFieldLabel
                })
              ]
            }
          ]
        }
      ]
    };
  }
}
