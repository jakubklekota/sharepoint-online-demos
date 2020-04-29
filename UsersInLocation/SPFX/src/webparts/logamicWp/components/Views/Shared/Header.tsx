import * as React from 'react';
import { Link } from 'react-router-dom';
import { Nav, INavLinkGroup, INavStyles } from 'office-ui-fabric-react';

export class Header extends React.Component<{}, {}> {

  public render(): React.ReactElement<{}> {
    const navStyles: Partial<INavStyles> = { root: { width: 300 } };
    const navLinkGroups: INavLinkGroup[] = [
      {
        name: 'MENU',
        links: [
          {
            key: 'home',
            name: 'Home',
            url: '#/home',
          },
          {
            key: 'users',
            name: 'Users',
            url: '#/user',
          },
          {
            key: 'location',
            name: 'Location',
            url: '#/localization',
          },
        ],
      }
    ];

    return (
      <Nav styles={navStyles} groups={navLinkGroups} />
    );
  }
}
