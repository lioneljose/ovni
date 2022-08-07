import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovni/blocs/blocs.dart';

class GpsAccesScreen extends StatelessWidget{
  
  const GpsAccesScreen({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
       body: Center(
        child : BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            
            return !state.isGpsEnabled 
            ? const _EnableGpsMessage()
            : const _AccessButton();
                
          },
        )
        //_AccessButton(),
        // child: _EnableGpsMessage()
       ),
       
       );
    
  }
}



class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          
          const Text("MARICO NECESITAMOS TU PUTO ACCESO", style: TextStyle( fontSize: 35, fontWeight: FontWeight.w300), ),
          
          //BOTON
          MaterialButton(
            child: const Text( "Solicitar Acceso", style: TextStyle(color: Colors.white)),
            color: Colors.pink,
            shape: const StadiumBorder(),
            elevation: 0,
            splashColor: Colors.transparent,
            onPressed: () {
              
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAccess();

            }
          )
        ],
      ),
    );
  }
}


class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
     "Debe de habilitar el GPS",
     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
     );
    
  }
}