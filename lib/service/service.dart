import 'package:door_pro/model/category_model.dart';
import 'package:door_pro/model/service_model.dart';

class Service {
  final Duration _delay = const Duration(milliseconds: 800);


  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(_delay);
    return const[
      CategoryModel(id: 'cat_1', name: 'Electrician', icon: '⚡'),
      CategoryModel(id: 'cat_2', name: 'Plumbing', icon: '🪠'),
      CategoryModel(id: 'cat_3', name: 'AC Repair', icon: '❄️'),
      CategoryModel(id: 'cat_4', name: 'Cleaning', icon: '🧹'),
    ];
  }
  Future<List<ServiceModel>>getServicesByCategory(String categoryId)async{
    await Future.delayed(_delay);
    final allServices = [
      const ServiceModel(
        id: 'srv_1',
        categoryId: 'cat_1',
        name: 'Fan Installation & Repair',
        imageUrl: 'https://picsum.photos/400/200?random=1',
        price: 299.0,
        rating: 4.8,
        duration: '45 mins',
        description: 'Complete inspection, wiring check, and installation of ceiling/wall fans.',
      ),
      const ServiceModel(
        id: 'srv_2',
        categoryId: 'cat_1',
        name: 'Switchboard Repair & Upgrade',
        imageUrl: 'https://picsum.photos/400/200?random=2',
        price: 199.0,
        rating: 4.6,
        duration: '30 mins',
        description: 'Safe replacement of burnt switches, fuses, and modular sockets.',
      ),
      const ServiceModel(
        id: 'srv_3',
        categoryId: 'cat_3',
        name: 'Deep AC Foam Cleaning',
        imageUrl: 'https://picsum.photos/400/200?random=3',
        price: 599.0,
        rating: 4.9,
        duration: '60 mins',
        description: 'High-pressure foam cleaning of coils, filter washing, and gas pressure check.',
      ),
    ];

    return allServices.where((service) => service.categoryId == categoryId).toList();
  }

}