/// Mapper API to convert domain entities to service models and vice-versa.
abstract class EntityMapper<E, M> {
  /// Const constructor.
  const EntityMapper();

  /// Convert model to entity.
  E mapEntity(M model);

  /// Convert entity to model.
  M mapModel(E entity);

  /// Convert many models to a list of entities.
  List<E> mapEntities(Iterable<M> models) => List.unmodifiable(models.map(mapEntity));

  /// Convert many entities to a list of models.
  List<M> mapModels(Iterable<E> entities) => List.unmodifiable(entities.map(mapModel));
}
