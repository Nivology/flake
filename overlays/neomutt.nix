_: prev: {
  neomutt = prev.neomutt.override (_: {
    withContrib = false;
    withNotmuch = false;
  });
}
