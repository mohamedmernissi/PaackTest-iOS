# PaackTest-iOS

For this project i used the VIPER architecture, with 2 modules :

    Deliveries List Module that contains the logic of fetching data from the api and storing it in a model.

    Deliveries details module that shows the delivery details and handle all the logic of sending data of the user after enabling active.
    
Viper stands for : 
    
    - View : the interface layer.
    - Interactor : responsible for retrieving data from the model layer,
    - Presenter : It connects view with other components.
    - Entity : Plain model classes used mostly by the interactor.
    - Router : The navigation logic of the application using UIKit classes ( for transitions between screens).


