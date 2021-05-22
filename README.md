
<img src="https://github.com/priyanshu0405/ASAP-IIT2019131/blob/master/images/log.jpeg" width="100%" height="400"> 

# About 

Emedgency is an emergency management system in hospitals or in more detail, it is a mobile application which will enable communication between doctors and patients while remaining at home. Also we have added a special SOS feature to call for an ambulance in case of an emergency.

It aims to -
- Patients can add thier vital parameters, if the vital parameters fluctuate beyond the specified threshold then he must be able to invoke a msg to his consulting doctor.
- Patient can check his/her past medical records.
- Patients can send SOS to call ambulance in case of emergency with the click of a button.
- Consulting doctors will receive an alert and be able to prescribe the medicine and suggestions online.

# Installation

***Host System Package Dependencies***

- NodeJS
- NPM
- MongoDB

***Requirements for Frontend***

- Android Studio
- Flutter SDK
- Dart plugin

```
git clone https://github.com/priyanshu0405/ASAP-IIT2019131.git
cd ASAP-IIT2019131
```
The backend is hosted on Heroku but if you want to run backend locally follow the steps -

Terminal Instance 1: Backend

```
cd backend
npm install 
npm start
```
and navigate to ```localhost:3000```.

Open the project in android studio and follow the steps -

Terminal Instance 2: Frontend

```
flutter pub get
flutter run
```
If you are running backend locally make changes in ```ASAP-IIT2019131/emedgency/lib/constants/StringConstant.dart``` file - 
Change the URL constant to - “http://localhost:3000/” .
