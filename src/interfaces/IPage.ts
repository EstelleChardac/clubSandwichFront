export default interface IPage {
  title: string;
  subTitle: string;
  description: string;
  image1: string;
  image2?: string;
  image3?: string;
  backgroundImg?: string;
  createdDate?: Date;
  website?: string;
  idUser?: number;
  idSupplier?: number;
  idAddress?: number;
}
