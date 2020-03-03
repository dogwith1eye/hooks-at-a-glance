import React from "react";

function useExpiration(milliseconds) {
  const [shouldRender, setShouldRender] = React.useState(true);
  React.useEffect(() => {
    const timeoutId = setTimeout(() => {
      setShouldRender(false);
    }, milliseconds);

    return () => clearTimeout(timeoutId);
  }, [milliseconds]);
  return shouldRender;
}

function useExpirationUI(milliseconds, renderableThing) {
  return useExpiration(milliseconds) ? renderableThing : null;
}

function SelfDestruct({ milliseconds, children }) {
  console.log(children);
  return useExpirationUI(milliseconds, children);
}

export default SelfDestruct;
