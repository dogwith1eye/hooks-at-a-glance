import React from "react";

function useExpiration(expirationDate) {
  const [shouldRender, setShouldRender] = React.useState(true);
  React.useEffect(() => {
    const timeoutId = setTimeout(() => {
      setShouldRender(false);
    }, expirationDate - Date.now());

    return () => clearTimeout(timeoutId);
  }, [expirationDate]);
  return shouldRender;
}

function useExpirationUI(expirationDate, renderableThing) {
  return useExpiration(expirationDate) ? renderableThing : null;
}

function SelfDestruct({ expirationDate, children }) {
  return useExpirationUI(expirationDate, children);
}

export default SelfDestruct;
