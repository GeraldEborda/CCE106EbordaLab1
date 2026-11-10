import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0B1B4D)),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Color(0xFF0B1B4D),
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xFF0B1B4D),
                    size: 30,
                  ),
                  onPressed: () => debugPrint('Cart clicked'),
                ),
                Positioned(
                  top: 4,
                  right: 2,
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF1558E6),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              introSection(),
              SizedBox(height: 16),
              deliveryCard(),
              SizedBox(height: 20),
              orderItemsHeader(),
              SizedBox(height: 12),
              CartItemCard(
                productName: 'Wireless Mouse',
                productPrice: 450.00,
                quantity: 1,
                productIcon: Icons.mouse_outlined,
              ),
              SizedBox(height: 12),
              CartItemCard(
                productName: 'USB-C Hub',
                productPrice: 850.00,
                quantity: 1,
                productIcon: Icons.usb,
              ),
              SizedBox(height: 12),
              CartItemCard(
                productName: 'Laptop Stand',
                productPrice: 700.00,
                quantity: 1,
                productIcon: Icons.laptop_mac,
              ),
              SizedBox(height: 16),
              discountBanner(),
              SizedBox(height: 16),
              paymentSummary(),
              SizedBox(height: 16),
              placeOrderButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget introSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xFFDCE9FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: Color(0xFF1558E6),
              fontWeight: FontWeight.w800,
              fontSize: 13,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Ready for checkout',
          style: TextStyle(
            color: Color(0xFF0B1B4D),
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Review your items before placing your order.',
          style: TextStyle(color: Color(0xFF5B6275), fontSize: 15),
        ),
      ],
    );
  }

  Widget deliveryCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: cardStyle(),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Color(0xFF1558E6), size: 32),
          SizedBox(width: 12),
          Container(width: 1, height: 40, color: Color(0xFFDDE1EA)),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to Glenn Oliva',
                  style: TextStyle(
                    color: Color(0xFF0B1B4D),
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Matina, Davao City',
                  style: TextStyle(color: Color(0xFF5B6275), fontSize: 15),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => debugPrint('Change delivery address clicked'),
            child: Text(
              'Change',
              style: TextStyle(
                color: Color(0xFF1558E6),
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // "Order Items" and "3 items" on one row
  Widget orderItemsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order Items',
          style: TextStyle(
            color: Color(0xFF0B1B4D),
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        Text(
          '3 items',
          style: TextStyle(color: Color(0xFF5B6275), fontSize: 16),
        ),
      ],
    );
  }

  // STUDENT10 discount banner
  Widget discountBanner() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Color(0xFFDCE9FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer_outlined, color: Color(0xFF1558E6), size: 30),
          SizedBox(width: 12),
          Container(width: 1, height: 38, color: Color(0xFF5B6275)),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    color: Color(0xFF1558E6),
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),
                ),
                Text(
                  '10% discount on items',
                  style: TextStyle(color: Color(0xFF5B6275), fontSize: 14),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: Color(0xFF1558E6), size: 38),
        ],
      ),
    );
  }

  // Payment summary card
  Widget paymentSummary() {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: cardStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(
              color: Color(0xFF0B1B4D),
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 10),
          SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          SummaryRow(label: 'Discount (10%)', amount: '- PHP 200.00'),
          SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Color(0xFFDDE1EA), thickness: 1, height: 1),
          ),
          SummaryRow(label: 'Total', amount: 'PHP 1,850.00', isTotal: true),
        ],
      ),
    );
  }

  Widget placeOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () => debugPrint('Place order clicked! Total: PHP 1850.00'),
        icon: Icon(Icons.lock, color: Colors.white),
        label: Text(
          'Place Order',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 19,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1558E6),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

BoxDecoration cardStyle() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Color(0xFFDDE1EA)),
  );
}

// One label + amount row in the payment summary
class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: Color(0xFF0B1B4D),
      fontSize: isTotal ? 24 : 17,
      fontWeight: isTotal ? FontWeight.w900 : FontWeight.w500,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textStyle),
          Text(amount, style: textStyle),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String productName;
  final double productPrice;
  final int quantity;
  final IconData productIcon;

  const CartItemCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.productIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: cardStyle(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product icon box
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Color(0xFFDCE9FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(productIcon, color: Color(0xFF0B1B4D), size: 38),
          ),
          SizedBox(width: 16),

          // Name, price, quantity controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF0B1B4D),
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'PHP ${productPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Color(0xFF1558E6),
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    QuantityButton(
                      icon: Icons.remove,
                      onPressed: () =>
                          debugPrint('Decrease quantity: $productName'),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 52,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFDDE1EA)),
                      ),
                      child: Text(
                        '$quantity',
                        style: TextStyle(
                          color: Color(0xFF0B1B4D),
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    QuantityButton(
                      icon: Icons.add,
                      onPressed: () =>
                          debugPrint('Increase quantity: $productName'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Delete button
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: Color(0xFF5B6275),
              size: 28,
            ),
            onPressed: () => debugPrint('Remove item: $productName'),
          ),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 52,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF1558E6), width: 1.6),
        ),
        child: Icon(icon, color: Color(0xFF1558E6), size: 22),
      ),
    );
  }
}
