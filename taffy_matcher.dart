#library("taffy_matcher");
#source("../dart-matchers/matchers.dart");

class _MapLookup implements Matcher<Map> {
  var _predicates;

  _MapLookup(this._predicates);

  bool matches(Map map) {
    //print ("predicates:");
    for(final k in _predicates.getKeys()) {
      //print ("\t${k}, ${v}");
      if(map[k] == null || map[k].toString() != _predicates[k].toString()) {
        return false;
      }
    };

    return true;
  }
}


Matcher<Map> lookup(predicates) => new _MapLookup(predicates);
