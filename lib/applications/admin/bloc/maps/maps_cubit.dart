import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps_state.dart';
part 'maps_cubit.freezed.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit() : super(const MapsState.initial());

  late GoogleMapController controller;
  CameraPosition initialPosition = const CameraPosition(
    target: LatLng(-7.887888021778556, 110.33187565562294),
    zoom: 18,
  );

  Set<Marker> markers = {};

  void createController(GoogleMapController controller) {
    emit(const MapsState.loading());
    this.controller = controller;
    emit(const MapsState.loaded());
  }

  void setInitialPosition(LatLng latLng) {
    initialPosition = CameraPosition(
      target: latLng,
      zoom: 18,
    );
  }

  void moveCameraToCurrentPosition(
      {double lat = -7.88788735757074, double lng = 110.33187632617513}) {
    try {
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 18),
      ));
    } catch (_) {}
  }

  void changeMarkerposition(LatLng position) {
    try {
      emit(const MapsState.loading());
      Marker marker = Marker(
        markerId: const MarkerId('customer'),
        draggable: false,
        position: position,
      );
      markers.add(marker);
      emit(const MapsState.loaded());
    } catch (_) {}
  }
}
