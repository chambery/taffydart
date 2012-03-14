#library("taffy_matcher");
#import("../dart-matchers/matchers.dart");

class _MapLookup implements Matcher<Map> {
  var _predicates;

  _MapLookup(this._predicates);

  bool matches(Map map) {
    //print ("predicates:");
    for(final k in _predicates.getKeys()) {
      bool decision = true;
      if(_predicates[k] is Map) {
        for(final l in _predicates[k].getKeys()) {
          switch(l) {
            case "contains" :
              if(map[k].toString().contains(_predicates[k][l].toString())) {
                print ("${map["name"]}: ${map[k]} contains ${_predicates[k][l]}");
              } else {
                print ("${map[k]} NOT contains ${_predicates[k][l]}");
                return false;
              }
            break;
          }
        }
      } else {
  	return isSame(map[k], _predicates[k]);
      }
    };

    return true;
  }

  bool isSame(o1, o2) {
    return (o1 == null || o1.toString() != o2.toString());
  }
}


Matcher<Map> lookup(predicates) => new _MapLookup(predicates);

