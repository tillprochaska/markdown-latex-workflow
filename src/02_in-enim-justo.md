# In enim justo {#sec:in-enim-justo}

In enim justo, rhoncus ut, imperdiet a ([@lst:js-example]), venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.

```{.js #lst:js-example caption="Javascript"}
export default const euclideanAlgorithm = (x, y) => {
  x = Math.abs(x);
  y = Math.abs(y);

  return (y === 0) ? a : euclideanAlgorithm(y, x % y);
}
```
