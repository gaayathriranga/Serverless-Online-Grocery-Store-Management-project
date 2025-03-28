var apiurljs = apiUrl;
var apiGatewayURL = apiurljs.APIInvokeURL;

document.addEventListener('DOMContentLoaded', (event) => {
    fetchGroceryItems();
});

async function fetchGroceryItems() {
    try {
        const response = await fetch(apiGatewayURL); 
        if (!response.ok) {
            throw new Error(`Failed to fetch items: ${response.statusText}`);
        }
        const items = await response.json();
        const tableBody = document.getElementById('groceryTableBody');
        tableBody.innerHTML = '';
        items.forEach(item => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${item.customerName}</td>
                <td>${item.productName}</td>
                <td>${item.quantity}</td>
                <td>${item.price}</td>
                <td>${item.total}</td>
            `;
            tableBody.appendChild(row);
        });
    } catch (error) {
        console.error('Error fetching grocery items:', error);
    }
}

async function addCustomer() {
    const productName = document.getElementById('productName').value;
    const customerName = document.getElementById('customerName').value;
    const quantity = document.getElementById('quantity').value;
    const price = document.getElementById('price').value;
    const total = quantity * price;

    const groceryItem = {
        productName,
        customerName,
        quantity,
        price,
        total
    };

    try {
        console.log('Sending request to API endpoint');
        const response = await fetch(apiGatewayURL, { 
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(groceryItem)
        });

        if (!response.ok) {
            throw new Error(`Server error: ${response.statusText}`);
        }

        const result = await response.json();
        console.log('Response from API:', result);

        if (result !== 'Grocery data saved successfully!') {
            throw new Error(`Unexpected response: ${result}`);
        }

        alert(result);
    
        document.getElementById('groceryForm').reset();

        const tableBody = document.getElementById('groceryTableBody');
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${customerName}</td>
            <td>${productName}</td>
            <td>${quantity}</td>
            <td>${price}</td>
            <td>${total}</td>
        `;
        tableBody.appendChild(row);

    } catch (error) {
        console.error('Error adding grocery item:', error);
        alert('Failed to add grocery item: ' + error.message);
    }
}
