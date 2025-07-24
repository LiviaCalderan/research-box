let timeout;

document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.getElementById("search-input");
  if(searchInput) {
    searchInput.addEventListener("input", () => {
      clearTimeout(timeout);

      timeout = setTimeout(() => {
        const searchQuery = searchInput.ariaValueMax.trim();

        if(searchQuery.length > 3) {
          fetch("/searches", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").getAttribute("content"),
            },
            body: JSON.stringify({user_search: searchQuery})
          });
        }
      }, 800);
    });
  }
});