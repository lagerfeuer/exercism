package listops

// IntList is an abstraction of a list of integers which we can define methods on
type IntList []int

func (s IntList) Foldl(fn func(int, int) int, initial int) int {
  for _, v := range s {
    initial = fn(initial, v)
  }
  return initial
}

func (s IntList) Foldr(fn func(int, int) int, initial int) int {
  for i := s.Length() - 1; i >= 0; i-- {
    initial = fn(s[i], initial)
  }
  return initial
}

func (s IntList) Filter(fn func(int) bool) IntList {
  tmp := make(IntList, 0)
  for _, v := range s {
    if fn(v) {
      tmp = append(tmp, v)
    }
  }
  return tmp
}

func (s IntList) Length() int {
  return len(s)
}

func (s IntList) Map(fn func(int) int) IntList {
  tmp := make(IntList, s.Length())
  for i, v := range s {
    tmp[i] = fn(v)
  }
  return tmp
}

func (s IntList) Reverse() IntList {
  tmp := make(IntList, s.Length())
  for i, v := range s {
    tmp[s.Length()-1-i] = v
  }
  return tmp
}

func (s IntList) Append(lst IntList) IntList {
  tmp := make(IntList, s.Length() + lst.Length())
  for i, v := range s {
    tmp[i] = v
  }
  for i, v := range lst {
    tmp[s.Length()+i] = v
  }
  return tmp
}

func (s IntList) Concat(lists []IntList) IntList {
  tmp := make(IntList, s.Length())
  copy(tmp, s)
  for _, l := range lists {
    tmp = tmp.Append(l)
  }
  return tmp
}
