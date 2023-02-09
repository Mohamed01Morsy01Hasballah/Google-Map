import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/Bloc/States.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsCubit extends Cubit<MapsStates>{
  MapsCubit():super(InitialState());
  static MapsCubit get(context)=>BlocProvider.of(context);
  var MyMarkers=HashSet<Marker>();
  List<Polyline> polyine=[];
  BitmapDescriptor? customMarker;
  void GetCustomMarker()async{
    customMarker=await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/images/2.png') as BitmapDescriptor? ;
    emit(CustomMarkerState());
  }
  void GetPolyLine(){
    polyine.add(
      Polyline(
          polylineId: PolylineId('1'),
        points: [
          LatLng(31.051944466654955, 30.442614311672664),
          LatLng(31.056012060641944, 30.43986199949384),
          LatLng(31.078476338761543, 30.425416005687097)

        ],

      width: 10,
        color: Colors.red
      )
    );
    emit(lineDrawState());
  }
  void showMarker(){
    MyMarkers.add(
        Marker(
         markerId: MarkerId('1'),
          position:LatLng(31.05113758035413, 30.44201066545329),
          infoWindow: InfoWindow(
            title: 'Mohamed Morsy',
            snippet: 'I am Flutter Developer',

          ),
          icon: customMarker!,

        )

    );
    emit(ChangeMarkerState());
  }
}