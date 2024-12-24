workspace {
    name "Snackbar System"
    description "C4 model for the Snackbar application system"

    model {
        customer = person "Customer" "A user who orders food from the snackbar"
        staff = person "Staff" "Restaurant staff who prepare and manage orders"

        softwareSystem = softwareSystem "Snackbar System" "Food ordering and management system" {
            # Containers
            api = container "Backend API" "Spring Boot REST API" "Java/Spring Boot" {
                # Components
                authComponent = component "IAM Component" "Handles authentication and user management"
                orderComponent = component "Order Component" "Manages customer orders"
                productComponent = component "Product Component" "Manages product catalog"
                checkoutComponent = component "Checkout Component" "Handles order checkout process"
                cookingComponent = component "Cooking Component" "Manages food preparation"
                pickupComponent = component "Pickup Component" "Handles order pickup and delivery"
            }

            database = container "MongoDB" "Stores all system data" "MongoDB"
        }

        # Relationships
        customer -> api "Uses" "HTTP/REST"
        staff -> api "Uses" "HTTP/REST"
        
        # Container relationships
        api -> database "Reads from and writes to" "MongoDB Driver"

        # Component relationships
        authComponent -> database "Reads/writes user data"
        orderComponent -> database "Reads/writes order data"
        productComponent -> database "Reads/writes product data"
        checkoutComponent -> database "Reads/writes checkout data"
        cookingComponent -> database "Reads/writes cooking status"
        pickupComponent -> database "Reads/writes pickup data"

        orderComponent -> authComponent "Validates user"
        checkoutComponent -> orderComponent "Creates order"
        cookingComponent -> orderComponent "Updates order status"
        pickupComponent -> cookingComponent "Monitors cooking status"
    }

    views {
        systemContext softwareSystem "SystemContext" {
            include *
            autoLayout
        }

        container softwareSystem "Containers" {
            include *
            autoLayout
        }

        component api "Components" {
            include *
            autoLayout
        }

        theme default
    }
}