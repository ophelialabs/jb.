    // Initialize modals
    const modalTriggerList = document.querySelectorAll('[data-bs-toggle="modal"]');
    modalTriggerList.forEach(el => new bootstrap.Modal(el));
    ;

    // Load Tech Stack
    fetch('Ophelia/stack/index.html')
        .then(res => res.ok ? res.text() : Promise.reject(res))
        .then(data => {
            const header = document.getElementById('techstack-placeholder');
            if (header) header.innerHTML = data;
        })
        .catch(() => {});