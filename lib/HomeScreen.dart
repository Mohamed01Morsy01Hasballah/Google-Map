import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/Bloc/Cubit.dart';
import 'package:flutter_map/Bloc/States.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  Set<Polygon> myPolygon() {
    List<LatLng> polygonCoords = [];
    polygonCoords.add(LatLng(37.43296265331129, -122.08832357078792));
    polygonCoords.add(LatLng(37.43006265331129, -122.08832357078792));
    polygonCoords.add(LatLng(37.43006265331129, -122.08332357078792));
    polygonCoords.add(LatLng(37.43296265331129, -122.08832357078792));

   var polygonSet =  Set<Polygon>();
    polygonSet.add(Polygon(
        polygonId: PolygonId('test'),
        points: polygonCoords,
        strokeColor: Colors.red));

    return polygonSet;
  }

  // draw circle
  Set<Circle> mycircles=Set.from(
    [
      Circle( circleId: CircleId('1'),
    center:LatLng( 31.05113758035413, 30.44201066545329),

    radius: 4000,
    fillColor: Colors.blue.shade100.withOpacity(0.5),
    strokeColor:  Colors.blue.shade100.withOpacity(0.1),
  ),
    ],

  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapsCubit,MapsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=MapsCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.hybrid ,
                initialCameraPosition: CameraPosition(
                    target: LatLng( 31.05113758035413, 30.44201066545329),
                    zoom: 19,

                ),
                  onMapCreated:(GoogleMapController googleMapController){
                  cubit.showMarker();


                  },
                  markers:cubit.MyMarkers,
                polygons: myPolygon(),
                circles: mycircles,
                polylines: cubit.polyine.toSet(),




              ),
              Container(
                width: double.infinity,
                height: 200,
              // can add image here
              //  child: Image.asset('assets/images/2.png'),
                alignment: AlignmentDirectional.topCenter,
              ),
              Container(
                child: Text('Programed by Mohamed Morsy'),
                alignment:AlignmentDirectional.bottomCenter ,
              )
            ],
          ),
        );
      },

    );
  }
}

