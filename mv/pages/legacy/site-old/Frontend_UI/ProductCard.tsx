import Link from 'next/link';
import Image from 'next/image';
import { Star } from 'lucide-react';

type ProductCardProps = {
  id: string;
  name: string;
  price: number;
  imageUrl: string;
  rating: number;
  reviewCount: number;
};

export default function ProductCard({ id, name, price, imageUrl, rating, reviewCount }: ProductCardProps) {
  return (
    <Link href={`/products/${id}`} className="group block border rounded-lg overflow-hidden shadow-sm hover:shadow-xl transition-shadow duration-300">
      <div className="relative w-full h-64">
        <Image src={imageUrl} alt={name} layout="fill" objectFit="cover" className="group-hover:scale-105 transition-transform duration-300" />
      </div>
      <div className="p-4 bg-white">
        <h3 className="text-lg font-semibold text-gray-800 truncate">{name}</h3>
        <p className="text-md font-bold text-blue-600 mt-1">${price.toFixed(2)}</p>
        <div className="flex items-center mt-2">
          <div className="flex items-center">
            {[...Array(5)].map((_, i) => <Star key={i} size={16} className={i < Math.round(rating) ? 'text-yellow-400 fill-current' : 'text-gray-300'} />)}
          </div>
          <span className="text-xs text-gray-500 ml-2">({reviewCount} reviews)</span>
        </div>
      </div>
    </Link>
  );
}