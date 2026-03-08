pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  case first {
    [] -> second
    [head, ..tail] -> [head, ..append(first: tail, second: second)]
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  case lists {
    [] -> []
    [head, ..tail] -> append(first: head, second: concat(tail))
  }
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  case list {
    [] -> []
    [head, ..tail] ->
      case function(head) {
        True -> [head, ..filter(tail, function)]
        False -> filter(tail, function)
      }
  }
}

pub fn length(list: List(a)) -> Int {
  foldl(over: list, from: 0, with: fn(b, _) -> Int { b + 1 })
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [head, ..tail] -> [function(head), ..map(tail, function)]
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [head, ..tail] ->
      foldl(over: tail, from: function(initial, head), with: function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [head, ..tail] ->
      function(foldr(over: tail, from: initial, with: function), head)
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(over: list, from: [], with: fn(b, a) -> List(a) { [a, ..b] })
}
