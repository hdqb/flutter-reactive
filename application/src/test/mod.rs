/**
 * Copyright 2020 Hadi Lashkari Ghouchani

 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at

 * http://www.apache.org/licenses/LICENSE-2.0

 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#[cfg(test)]
mod test {
    use presentation::action::page::main_page::MainPage::ButtonClicked;
    use presentation::action::page::PageType::MainPageType as MainPageTypeAction;
    use presentation::action::Root as RootAction;
    use presentation::action::user::User as UserAction;
    use presentation::state::page::PageType::MainPageType as MainPageTypeState;
    use presentation::state::Root as RootState;

    use crate::app::application::App;
    use presentation::action::page::main_page::MainPage;
    use presentation::state::page::main_page::text::Text;

    #[test]
    fn apply_click_action_on_default_state() {
        let mut app = App::new();
        let root = app.state();
        //
        // println!("{:?}, {:?}",root,MainPageTypeState { page: Default::default() });
        assert!(matches!(root.page, MainPageTypeState {page} if page.text.count == Option::from(None)  ));

        app.dispatch(click_action(String::from("1")));

        // println!("{:?}, {:?}",root,MainPageTypeState { page: Default::default() });
        let new_root = app.state();
        assert!(matches!(new_root.page, MainPageTypeState {page} if page.text.count ==  Option::from(String::from("1"))  ));

        // println!("{:?}, ",new_root);
    }

    #[test]
    fn apply_click_action_on_default_state_by_registration() {
        let mut app = App::new();
        let listener = |state: &RootState| {
             // println!("{:?}, {:?}",state,MainPageTypeState { page: Default::default() });
            assert!(matches!(state.clone().page, MainPageTypeState {page} if page.text.count == Option::from(String::from("1"))  ));
        };
        app.register_for_updates(listener);
        let root = app.state();

        // println!("{:?}, {:?}",root,MainPageTypeState { page: Default::default() });
        assert!(matches!(root.page, MainPageTypeState {page} if page.text.count == Option::from(None) ));
        app.dispatch(click_action(String::from("1")));

        println!("{:?}, ",app.state());

    }

    fn click_action(name: String) -> RootAction {
        RootAction {
            user: UserAction::None,
            page: MainPageTypeAction {
                page: ButtonClicked {name: String::from(&name)},
            },
        }
    }
}
