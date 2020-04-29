import * as React from 'react';
import { BrowserRouter as Router, Route, Link, Redirect, Switch, HashRouter, PropsRoute} from 'react-router-dom';

import { Header } from './Views/Shared/Header';

import { UserView } from './Views/User/List';
import { LocalizationView } from './Views/Localization/List';
import { HomeView } from './Views/Home/List';

import { ILogamicWpProps } from './ILogamicWpProps';
import { StackItem, Stack } from 'office-ui-fabric-react';

export default class LogamicWp extends React.Component<ILogamicWpProps, {}> {

  public render(): React.ReactElement<ILogamicWpProps> {
    return (
      <div>
        <HashRouter >
          <Stack horizontal gap={15}>
            <Header />
            <StackItem grow={2}>
              <Switch>
                <Route path='/home' component={() => <HomeView  {...this.props} />} />
                <Route path='/user' component={() => <UserView  {...this.props} />} />
                <Route path='/localization' component={() => <LocalizationView  {...this.props} />} />
              </Switch>
            </StackItem>
          </Stack>
        </HashRouter>
      </div>
      );
  }
}

