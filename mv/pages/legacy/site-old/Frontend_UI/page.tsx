'use client';

import Image from 'next/image';
import { Star, Plus, Minus } from 'lucide-react';
import { useState, useEffect } from 'react';

type Product = {
  id: string;
  name: string;
  price: number;
  description: string;
  imageUrl: string;
  rating: number;
  reviewCount: number;
};

export default async function ProductDetailPage({ params }: { params: { id: string } }) {
  const [product, setProduct] = useState<Product | null>(null);
  const [quantity, setQuantity] = useState(1);

  // Mock data fetching - this would fetch from a Catalog service
  useEffect(() => {
    const fetchProduct = async () => {
      // Simulate network delay
      await new Promise(res => setTimeout(res, 300));
      // In a real app: const res = await fetch(`https://catalog-service/products/${params.id}`);
      setProduct({
        id: params.id,
        name: `Sample Product ${params.id}`,
        price: 99.99,
        description: 'This is a detailed description of the product. It highlights key features, benefits, and specifications. Built with quality materials for durability and performance. Perfect for both personal and professional use.',
        imageUrl: `https://via.placeholder.com/600x600.png/6C757D/FFFFFF?text=Product+${params.id}`,
        rating: 4.6,
        reviewCount: 310,
      });
    };
    fetchProduct();
  }, [params.id]);

  if (!product) {
    return <div className="container mx-auto px-6 py-12 text-center">Loading product...</div>;
  }

  return (
    <div className="container mx-auto px-6 py-12">
      <div className="grid md:grid-cols-2 gap-12 items-start">
        <div className="relative w-full aspect-square rounded-lg overflow-hidden shadow-lg">
          <Image src={product.imageUrl} alt={product.name} layout="fill" objectFit="cover" />
        </div>
        <div>
          <h1 className="text-4xl font-extrabold text-gray-900">{product.name}</h1>
          <div className="flex items-center my-4">
            <div className="flex items-center">
              {[...Array(5)].map((_, i) => <Star key={i} size={20} className={i < Math.round(product.rating) ? 'text-yellow-400 fill-current' : 'text-gray-300'} />)}
            </div>
            <span className="text-sm text-gray-600 ml-3">{product.rating.toFixed(1)} ({product.reviewCount} reviews)</span>
          </div>
          <p className="text-3xl font-bold text-blue-600 my-4">${product.price.toFixed(2)}</p>
          
          <div className="flex items-center space-x-4 my-6">
            <p className="font-semibold">Quantity:</p>
            <div className="flex items-center border rounded-md">
              <button onClick={() => setQuantity(q => Math.max(1, q - 1))} className="p-2 text-gray-600 hover:bg-gray-100"><Minus size={16} /></button>
              <span className="px-4 font-bold">{quantity}</span>
              <button onClick={() => setQuantity(q => q + 1)} className="p-2 text-gray-600 hover:bg-gray-100"><Plus size={16} /></button>
            </div>
          </div>

          <button className="mt-6 w-full bg-blue-600 text-white py-3 px-6 rounded-lg font-semibold text-lg hover:bg-blue-700 transition-colors">
            Add to Cart
          </button>
          <p className="text-gray-600 leading-relaxed mt-6">{product.description}</p>
        </div>
      </div>
    </div>
  );
}