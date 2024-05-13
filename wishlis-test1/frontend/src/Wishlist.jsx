import React, { useState, useEffect } from "react";
import axios from "axios";

const Wishlist = () => {
  const [wishlists, setWishlists] = useState([]);
  const [newWishlistName, setNewWishlistName] = useState("");

  useEffect(() => {
    fetchWishlists();
  }, []);

  const fetchWishlists = async () => {
    try {
      const response = await axios.get("/api/wishlists");
      setWishlists(response.data);
    } catch (error) {
      console.error("Error fetching wishlists: ", error);
    }
  };

  const createWishlist = async () => {
    try {
      const response = await axios.post("/api/wishlists", {
        name: newWishlistName,
      });
      setWishlists([...wishlists, response.data]);
      setNewWishlistName("");
    } catch (error) {
      console.error("Error creating Wishlist: ", error);
    }
  };
  return (
    <div>
      <h1>Wishlists</h1>
      <div>
        <input
          type="text"
          value={newWishlistName}
          onChange={(e) => setNewWishlistName(e.target.value)}
          placeholder="Enter wishlist name"
        />
        <button onClick={createWishlist}>Create Wishlist</button>
      </div>
      <ul>
        {wishlists.map((wishlist) => (
          <li key={wishlist.id}>{wishlist.name}</li>
        ))}
      </ul>
    </div>
  );
};

export default Wishlist;
