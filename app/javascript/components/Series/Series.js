import React, { useState, useEffect, Fragment } from "react";
import axios from "axios";

const Series = () => {
  const [series, setSeries] = useState([]);

  useEffect(() => {
    //Get all of our airlines from api
    //Update airlines in our state
    axios
      .get("/api/v1/series")
      .then((resp) => {
        setSeries(resp.data.data);
      })
      .catch((resp) => console.log(resp));
  }, [series.lenght]);

  const list = series.map((item) => {
    return <li key={item.attributes.name}>{item.attributes.name}</li>;
  });

  return (
    <Fragment>
      <div>This is the Series#index view for our app!</div>
      <ul>{list}</ul>
    </Fragment>
  );
};

export default Series;
